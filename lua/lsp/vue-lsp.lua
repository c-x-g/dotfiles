require"lspconfig".volar.setup {
  filetypes = {"vue"},
  init_options = {
    {documentFormatting = true},
    documentFeatures = {
      documentColor = false,
      documentFormatting = {defaultPrintWidth = 100, indentSize = 2, tabWidth = 2},
      documentSymbol = true,
      foldingRange = true,
      linkedEditingRange = true,
      selectionRange = true
    },
    languageFeatures = {
      callHierarchy = true,
      codeAction = true,
      codeLens = true,
      completion = {defaultAttrNameCase = "kebabCase", defaultTagNameCase = "both"},
      definition = true,
      diagnostics = true,
      documentHighlight = true,
      documentLink = true,
      hover = true,
      implementation = true,
      references = true,
      rename = true,
      renameFileRefactoring = true,
      schemaRequestService = true,
      semanticTokens = false,
      signatureHelp = true,
      typeDefinition = true
    },
    typescript = {serverPath = ""}
  }
}
