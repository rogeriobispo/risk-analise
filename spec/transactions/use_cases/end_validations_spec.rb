require_relative '../../spec_helper'

RSpec.describe EndValidations do
  subject(:end_validation) { described_class.execute() }

  it { expect(end_validation).to be_truthy}
end
