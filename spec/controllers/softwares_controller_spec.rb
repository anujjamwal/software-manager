require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SoftwaresController do

  # This should return the minimal set of attributes required to create a valid
  # Software. As you add validations to Software, be sure to
  # adjust the attributes here as well.
  let(:operating_system) { OperatingSystem.create(name: 'Windows')}
  let(:valid_attributes) { { "name" => "MyString", "path" => 'path/to/software', 'operating_system_id' => operating_system.id } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SoftwaresController. Be sure to keep this updated too.
  let(:auth_user) { FactoryGirl.create(:user, name: 'Authenticated User', email: 'auth.user@sft.com', role: UserRole.first)}
  let(:valid_session) { {'user_id' => auth_user.id} }


  describe "GET index" do
    it "assigns all softwares as @softwares" do
      software = Software.create! valid_attributes
      get :index, {}, valid_session
      assigns(:softwares).should eq([software])
    end
  end

  describe "GET show" do
    it "assigns the requested software as @software" do
      software = Software.create! valid_attributes
      get :show, {:id => software.to_param}, valid_session
      assigns(:software).should eq(software)
    end
  end

  describe "GET download" do
    it "downloads the file at path in @software" do
      policy = DownloadPolicy.find_or_create_by_id(1)
      software = Software.create! valid_attributes
      software.download_policy = policy
      software.save!

      controller.should_receive(:send_file)
                .with(software.path, buffer_size: 4096, stream: true, type: 'application/octet-stream')
                .and_return{controller.render :nothing => true}

      get :download, {:id => software.to_param}, valid_session
    end
  end

  describe "GET new" do
    it "assigns a new software as @software" do
      get :new, {}, valid_session
      assigns(:software).should be_a_new(Software)
    end
  end

  describe "GET edit" do
    it "assigns the requested software as @software" do
      software = Software.create! valid_attributes
      get :edit, {:id => software.to_param}, valid_session
      assigns(:software).should eq(software)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Software" do
        expect {
          post :create, {:software => valid_attributes}, valid_session
        }.to change(Software, :count).by(1)
      end

      it "assigns a newly created software as @software" do
        post :create, {:software => valid_attributes}, valid_session
        assigns(:software).should be_a(Software)
        assigns(:software).should be_persisted
      end

      it "redirects to the created software" do
        post :create, {:software => valid_attributes}, valid_session
        response.should redirect_to(Software.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved software as @software" do
        # Trigger the behavior that occurs when invalid params are submitted
        Software.any_instance.stub(:save).and_return(false)
        post :create, {:software => { "name" => "invalid value" }}, valid_session
        assigns(:software).should be_a_new(Software)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Software.any_instance.stub(:save).and_return(false)
        post :create, {:software => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested software" do
        software = Software.create! valid_attributes
        # Assuming there are no other softwares in the database, this
        # specifies that the Software created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Software.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => software.to_param, :software => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested software as @software" do
        software = Software.create! valid_attributes
        put :update, {:id => software.to_param, :software => valid_attributes}, valid_session
        assigns(:software).should eq(software)
      end

      it "redirects to the software" do
        software = Software.create! valid_attributes
        put :update, {:id => software.to_param, :software => valid_attributes}, valid_session
        response.should redirect_to(software)
      end
    end

    describe "with invalid params" do
      it "assigns the software as @software" do
        software = Software.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Software.any_instance.stub(:save).and_return(false)
        put :update, {:id => software.to_param, :software => { "name" => "invalid value" }}, valid_session
        assigns(:software).should eq(software)
      end

      it "re-renders the 'edit' template" do
        software = Software.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Software.any_instance.stub(:save).and_return(false)
        put :update, {:id => software.to_param, :software => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested software" do
      software = Software.create! valid_attributes
      expect {
        delete :destroy, {:id => software.to_param}, valid_session
      }.to change(Software, :count).by(-1)
    end

    it "redirects to the softwares list" do
      software = Software.create! valid_attributes
      delete :destroy, {:id => software.to_param}, valid_session
      response.should redirect_to(softwares_url)
    end
  end

end
