Kernel.at_exit {
  File.open("~/.irb.log", "w") do |f|
    f << Readline::HISTORY.to_a.join("\n")
  end
}
