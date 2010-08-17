# Remove this file after deprecation
if caller.none? { |l| l =~ %r{lib/rails/generators\.rb:(\d+):in `lookup!'$} }
  warn "[WARNING] `rails g actic_install` is deprecated, please use `rails g actic:install` instead."
end