require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
    it { is_expected.to belong_to(:user) }
    #test to assure no repeat URL's are submitted
end
