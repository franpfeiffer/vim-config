local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'html',  -- Asegúrate de tener instalado el servidor LSP de HTML
  'cssls', -- También puedes instalar el servidor para CSS
  -- Añade más servidores LSP si lo necesitas
})

-- Configuración de nvim-cmp
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- Configuración de mapeos adicionales aquí si es necesario
end)

lsp.setup()

