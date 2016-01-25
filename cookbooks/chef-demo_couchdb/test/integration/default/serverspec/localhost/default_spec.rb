require_relative '../spec_helper'

describe port(5984) do
  it { should be_listening.with('tcp') }
end
