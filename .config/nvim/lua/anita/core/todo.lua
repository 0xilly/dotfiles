-- todo(antia): Add a way for block comments to be made
-- todo(anita): Make it so comments can be inserted before lines

local function get_current_user()
	local username = os.getenv('USER') or os.getenv('USERNAME')
	if not username then
		username = ""
	end
	return username
end

local comment_styles = {
	c          = { line = '//',   start_block = '/*',     end_block = '*/'   },
	cpp        = { line = '//',   start_block = '/*',     end_block = '*/'   },
	go         = { line = '//',   start_block = '/*',     end_block = '*/'   },
	java       = { line = '//',   start_block = '/*',     end_block = '*/'   },
	javascript = { line = '//',   start_block = '/*',     end_block = '*/'   },
	typescript = { line = '//',   start_block = '/*',     end_block = '*/'   },
	lua        = { line = '--',   start_block = '--[[',   end_block = ']]'   },
	python     = { line = '#',    start_block = '"""',    end_block = '"""'  },
	ruby       = { line = '#',    start_block = '=begin', end_block = '=end' },
	html       = { line = '<!--', start_block = '<!--',		end_block = '-->'  },
	xml        = { line = '<!--', start_block = '<!--',  	end_block = '-->'  },

	-- Note(anita): Add more as needed
  default = { line = '#', start_block = ": <<'EOF'", end_block = 'EOF' }, -- Default to shell script style comments
}

local function get_comment_idents()
	local file_type = vim.bo.filetype
	return comment_styles[file_type] or comment_styles.default
end

function contains(array, value)
	for i, v in ipairs(array) do
		if v == value then
			return true
		end
	end
	return false
end

local function add_comment(type)
	local str = string.format('%s %s(%s): ', get_comment_idents().line, type, get_current_user())

	-- get current current cursor pos
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))

	vim.api.nvim_buf_set_lines(0, row, row, false, {str})
	vim.api.nvim_win_set_cursor(0, {row + 1, col })
end

vim.api.nvim_create_user_command('AATodo', function()
	add_comment('todo')
end, {})

vim.api.nvim_create_user_command('AAFixme', function()
	add_comment('fixme')
end, {})

vim.api.nvim_create_user_command('AAInfo', function()
	add_comment('info')
end, {})

vim.api.nvim_create_user_command('AAWarn', function()
	add_comment('warn')
end, {})


