require "bundler/gem_tasks"
require "rdoc/task"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new
task :default => :spec


Rake::RDocTask.new(:rdoc_dev) do |rd|
	rd.main = "README.doc"
	rd.rdoc_files.include("README.rdoc", "lib/**/*.rb")
    	rd.options << "--all"
end

desc "Ejecutar pruebas spec y volcar el resultado en un fichero html"
task :html do
	sh "rspec -I. -Ilib -Ilib/naranjero -Ispec spec/naranjero_spec.rb --format html > doc/test/index.html"
        sh "firefox doc/test/index.html"
end

desc "Ejecutar pruebas spec y volcar el resultado en un fichero de texto"
task :doc do
	sh "rspec -I. -Ilib -Ilib/naranjero -Ispec spec/naranjero_spec.rb --format documentation"
end
