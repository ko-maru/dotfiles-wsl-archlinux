return {
  "nvim-orgmode/orgmode",
  dependencies = { "nvim-orgmode/org-bullets.nvim" },
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    require("orgmode").setup({
      org_agenda_files = "~/orgfiles/**/*",
      org_default_notes_file = "~/orgfiles/refile.org",
      org_todo_keywords = { "TODO(t)", "WAITING(w)", "|", "DONE(d)", "CANCELED(c)" },
      org_capture_templates = {
        t = {
          description = "Task",
          target = "~/orgfiles/tasks.org",
          template = "* TODO %?\n %u",
        },
        j = {
          description = "Journal",
          target = "~/orgfiles/journals/%<%Y-%m>.org",
          template = "* %?",
          datetree = {
            tree_type = "custom",
            tree = {
              {
                format = "%Y.%m.%d",
                pattern = "^(%d%d%d%d).(%d%d).(%d%d)$",
                order = { 1 },
              },
            },
          },
        },
      },
    })
    require("org-bullets").setup()
  end,
}
