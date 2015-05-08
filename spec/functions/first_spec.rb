require 'spec_helper'

describe 'ulib::first' do
  let(:input) { [1,2,3] }
  let(:udef) { Puppet::Pops::Types::TypeFactory.undef() }

  it { expect(subject).to run.with_params(input).and_return(1) }
  it { expect(subject).to run.with_params(input, 2).and_return([1,2]) }
  it { expect(subject).to run.with_params(input, 10).and_return([1,2,3]) }

  # Stuff we don't accept.
  it { expect(subject).to run.with_params(input, -1).and_raise_error(/called with mis-matched arguments/) }
  it { expect(subject).to run.with_params(udef).and_raise_error(/called with mis-matched arguments/) }
  it { expect(subject).to run.with_params([]).and_raise_error(/called with mis-matched arguments/) }
end
