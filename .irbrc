Kernel.at_exit {
  File.open("#{ENV['HOME']}/.irb.log", "w") do |f|
    f << Readline::HISTORY.to_a.join("\n")
  end
}
