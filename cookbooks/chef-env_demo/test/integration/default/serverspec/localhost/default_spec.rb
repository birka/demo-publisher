require_relative '../spec_helper'

describe command('echo "foo"') do
  its(:stdout) { should match '^foo' }
end
