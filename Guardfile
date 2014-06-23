interactor history_file: "/dev/null"

guard "nanoc" do
  watch("config.yaml")
  watch("Rules")
  watch(%r{^(content|layouts|lib|static)/.*$})
end
