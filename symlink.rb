#!/usr/bin/env ruby

require "colorize"

dotfiles = %w[.vim .vimrc .zshrc]

dotfiles.each do |dotfile|
  src = File.join(__dir__, dotfile)
  dest = File.join(Dir.home, dotfile)

  if File.exist?(dest)
    puts "Skipped: #{dest} already exists".yellow
    next
  end

  system(`ln -s #{src} #{dest}`)
  puts "Symlinked: #{dest} points to #{src}".green
end
