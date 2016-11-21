Gem::Specification.new do |s|
    s.name      = 'monsenso-serverspec'
    s.version   = '1.0.0'
    s.date      = '2016-11-21'
    s.summary   = 'Monsenso Serverspec types'
    s.description = 'Custom Serverspec type by Monsenso'
    s.authors   = ['Simon Bang Terkildsen']
    s.email     = 'terkildsen@monsenso.com'
    s.files     = ['lib/couchbase_document.rb']
    s.homepage  = 'https://github.com/Monsenos/chef-monsenso-serverspec'
    s.license   = 'MIT'

    s.add_runtime_dependency 'couchbase', '1.3.13'
end
