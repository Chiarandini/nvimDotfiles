-- Holds custom plugin bundles it is a table of imports
-- plugin bundles are stored in "plugins"

Plugin_bundle = {}

table.insert(Plugin_bundle, {import = "plugins.keyboardMode"})
table.insert(Plugin_bundle, {import = "plugins.obsidian"})
table.insert(Plugin_bundle, {import = "plugins.websiteTools"})
table.insert(Plugin_bundle, {import = "plugins.git_extras"})
table.insert(Plugin_bundle, {import = "plugins.translation"})
table.insert(Plugin_bundle, {import = "plugins.bloat_analysis"})
table.insert(Plugin_bundle, {import = "plugins.activate"})
table.insert(Plugin_bundle, {import = "plugins.AI"})
table.insert(Plugin_bundle, {import = "plugins.presentation"})
table.insert(Plugin_bundle, {import = "plugins.helpview"})
table.insert(Plugin_bundle, {import = "plugins.comment-box"})
table.insert(Plugin_bundle, {import = "plugins.thanks"})
table.insert(Plugin_bundle, {import = "plugins.betterTerm"})
table.insert(Plugin_bundle, {import = "plugins.neo-tree"})
-- table.insert(Plugin_bundle, {import = "plugins.telescope_extras"})
-- table.insert(Plugin_bundle, {import = "plugins.games"})

return Plugin_bundle
