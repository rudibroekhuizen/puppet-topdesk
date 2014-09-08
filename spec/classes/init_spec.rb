require 'spec_helper'
describe 'topdesk' do

  context 'with defaults for all parameters' do
    it { should contain_class('topdesk') }
  end
end
