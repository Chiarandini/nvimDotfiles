-- Holds custom plugin bundles it is a table of imports
-- plugin bundles are stored in "plugins"

Plugin_bundle = {}

table.insert(Plugin_bundle, {import = "plugins.keyboardMode"})
table.insert(Plugin_bundle, {import = "plugins.obsidian"})

return Plugin_bundle
