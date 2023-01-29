-- for new sql file, automatically set buffer db to dev by default
-- and set keymap to run selection
-- if no g:dev, set it in after/plugins/dburls.lua
vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = { "sql" },
  command = [[
    let b:db = g:dev
    vnoremap <leader>r :DB b:db<CR>
    ]]
}
)

vim.g.dbs = {
  dev = "postgres://postgres:postgres@localhost:5432/orders_service_dev",
  staging = "postgres://postgres:postgres@localhost:5433/orders_service_dev",
  staging_fas = "postgres://postgres:postgres@localhost:5433/facility_activity_service_dev",
}

vim.g.db_ui_auto_execute_table_helpers = 1
