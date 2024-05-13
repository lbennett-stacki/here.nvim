local Here = {}

function Here.run(split_dir, args)
	local split_cmd = split_dir == "vertical" and "vsp " or "sp "
	vim.cmd(split_cmd .. vim.fn.expand("%:h") .. "/" .. args.args)
end

function Here.setup(opts)
	opts = opts or {}

	local vertical_commands = { "Hv", "Herev" }
	for _, cmd in pairs(vertical_commands) do
		vim.api.nvim_create_user_command(cmd, function(args)
			Here.run("vertical", args)
		end, { nargs = "?" })
	end

	local horizontal_commands = { "H", "Here" }
	for _, cmd in pairs(horizontal_commands) do
		vim.api.nvim_create_user_command(cmd, function(args)
			Here.run("horizontal", args)
		end, { nargs = "?" })
	end
end

return Here
