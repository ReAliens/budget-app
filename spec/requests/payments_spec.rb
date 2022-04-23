require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  context 'routes' do
    it { should route(:get, '/payments').to(action: :index) }
    it { should route(:post, '/payments').to(action: :create) }
    it { should route(:get, '/payments/new').to(action: :new) }
  end
end
