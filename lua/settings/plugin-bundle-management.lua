-- Holds custom plugin bundles it is a table of imports
-- plugin bundles are stored in "plugins"

Plugin_bundle = {}

table.insert(Plugin_bundle, {import = "plugins.keyboardMode"})
table.insert(Plugin_bundle, {import = "plugins.obsidian"})
table.insert(Plugin_bundle, {import = "plugins.websiteTools"})
table.insert(Plugin_bundle, {import = "plugins.git_extras"})
table.insert(Plugin_bundle, {import = "plugins.games"})

return Plugin_bundle
