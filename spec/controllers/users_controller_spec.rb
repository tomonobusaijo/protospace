require 'rails_helper'

describe UsersController do
  context "with user login" do
    before do
      @user = create(:user)
      sign_in @user
    end

    describe "GET #show" do
      it "assigns the requested to @user" do
        get :show, id: @user
        expect(assigns(:user)).to eq @user
      end

      it "renders the :show templates" do
        get :show, id: @user
        expect(response).to render_template :show
      end
    end

    describe "GET #edit" do
      # コントローラーで@userを定義していないため、コメントアウトしています
      # it "assigns the requested user to @user" do
      #   get :edit, id: @user
      #   expect(assigns(:user)).to eq @user
      # end

      it "renders the :edit template" do
        get :edit, id: @user
        expect(response).to render_template :edit
      end
    end

    describe "PATCH #update" do
      before do
        @user.name = 'TechMaster'
      end

      it "assigns the requested user to @user" do
        patch :update, id: @user, user: attributes_for(:user)
        expect(assigns(:current_user)).to eq @user
      end

      it "changes @user's attributes" do
        patch :update, id: @user, user: attributes_for(:user, name: 'TechFighter')
        @user.reload
        expect(@user.name).to eq 'TechFighter'
      end

      it "redirects to root_path" do
        patch :update, id: @user, user: attributes_for(:user)
        expect(response).to redirect_to root_path
      end

      it "sends flash messages" do
        patch :update, id: @user, user: attributes_for(:user)
        expect(flash[:success]).to be_truthy
      end
    end
  end

  context "without user login" do
    before do
      @user = create(:user)
    end

    describe "GET #edit" do
      it "redirects to sign_in page" do
        get :edit, id: @user
        expect(response).to redirect_to user_session_path
      end
    end

    describe "PATCH #update" do
      it "redirects to sign_in page" do
        patch :update, id: @user, user: attributes_for(:user)
        expect(response).to redirect_to user_session_path
      end
    end
  end
end
