RSpec.describe Halo::Client do
  subject { described_class.new }

  it { expect(subject).to be_instance_of Halo::Client }
  it { respond_to?(:api_key) }
  it { respond_to?(:base_uri) }

  it { expect(subject.stats).to be_instance_of Halo::Services::Stats }
  it { expect(subject.metadata).to be_instance_of Halo::Services::Metadata }
  it { expect(subject.profile).to be_instance_of Halo::Services::Profile }
end
