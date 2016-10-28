require 'rails_helper'

describe PrototypesController do
  context "with user login" do
    before do
      @user = create(:user)
      sign_in @user
      @prototype = create(:prototype, user: @user)
    end

    describe "GET #index" do
      it "assigns the requested prototypes to @prototypes" do
        get :index
        expect(assigns(:prototypes)).to include @prototype
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template root_path
      end
    end

    describe "GET #new" do
      it "assigns the requested prototypes to @prototype" do
        get :new
        expect(assigns(:prototype)).to be_a_new Prototype
      end

      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "saves the new prototype in the database" do
          expect{post :create, prototype: attributes_for(:prototype)}.to change(Prototype, :count).by(1)
        end

        it "redirects to root_path" do
          post :create, prototype: attributes_for(:prototype)
          expect(response).to redirect_to root_path
        end

        it "shows flash messages to show save the prototype successfully" do
          post :create, prototype: attributes_for(:prototype)
          expect(flash[:success]).to eq "Prototype was successfully created."
        end
      end

      context "with invalid attributes" do
        it "doesn't save the new prototype in the database" do
          expect{post :create, prototype: attributes_for(:invalid_prototype)}.not_to change(Prototype, :count)
        end

        it "redirects to new_prototype_path" do
          post :create, prototype: attributes_for(:invalid_prototype)
          expect(response).to redirect_to new_prototype_path
        end

        it "shows flash messages to show save the prototype unsuccessfully" do
          post :create, prototype: attributes_for(:invalid_prototype)
          expect(flash[:danger]).to eq "Prototype posting was failured."
        end
      end
    end

    describe "GET #show" do
      it "assigns the requested prototype to @prototype" do
        get :show, id: @prototype
        expect(assigns(:prototype)).to eq @prototype
      end

      it "assigns the requested comment to @comment" do
        get :show, id: @prototype
        expect(assigns(:comment)).to be_a_new Comment
      end

      it "assigns likes associated with prototype to @likes" do
        @likes = create_list(:like, 3, user: @user, prototype: @prototype)
        get :show, id: @prototype
        expect(assigns(:likes)).to eq @likes
      end

      it "renders the :show template" do
        get :show, id: @prototype
        expect(response).to render_template :show
      end
    end

    describe "GET #edit" do
      it "assigns the requested prototype to @prototype" do
        get :edit, id: @prototype
        expect(assigns(:prototype)).to eq @prototype
      end

      # @main_image, @sub_imageをコントローラーで使用していないため省略

      # it "assigns main_image to @main_image" do
      # end

      # it "assigns sub_images to @sub_images" do
      # end

      it "renders the :edit template" do
        get :edit, id: @prototype
        expect(response).to render_template :edit
      end
    end

    describe "PATCH #update" do
      before do
        @prototype.title = "TECH::MASTER"
        @prototype.catchcopy = "a month changing your life"
      end

      context "with valid attributes" do
        it "assigns the requested prototype to @prototype" do
          patch :update, id: @prototype, prototype: attributes_for(:prototype)
          expect(assigns(:prototype)).to eq @prototype
        end

        # @commentをコントローラーで使用していないため省略
        # it "assigns the requested comment to @comment" do
        # end

        it "updates attributes of prototype" do
          patch :update, id: @prototype, prototype: attributes_for(:prototype, title: "TECH::BEGINNER", catchcopy: "three months changing your life")
          @prototype.reload
          expect(@prototype.title).to eq "TECH::BEGINNER"
          expect(@prototype.catchcopy).to eq "three months changing your life"
        end

        it "redirects to root_path" do
          patch :update, id: @prototype, prototype: attributes_for(:prototype)
          expect(response).to redirect_to root_path
        end

        it "shows flash messages to show update the prototype successfully" do
          patch :update, id: @prototype, prototype: attributes_for(:prototype)
          expect(flash[:success]).to eq "Prototype was successfully updated."
        end
      end

      context "with invalid attributes" do
        it "assigns the requested prototype to @prototype" do
          patch :update, id: @prototype, prototype: attributes_for(:invalid_prototype)
          expect(assigns(:prototype)).to eq @prototype
        end

        it "doesn't update the prototype's attributes" do
          patch :update, id: @prototype, prototype: attributes_for(:prototype, title: "TECH::BEGINNER", catchcopy: nil)
          expect(@prototype.title).not_to eq "TECH::BEGINNER"
          expect(@prototype.catchcopy).to eq "a month changing your life"
        end

        it "redirects to edit_prototype_path" do
          patch :update, id: @prototype, prototype: attributes_for(:invalid_prototype)
          expect(response).to redirect_to edit_prototype_path
        end

        it "shows flash messages to show update the prototype unsuccessfully" do
          patch :update, id: @prototype, prototype: attributes_for(:invalid_prototype)
          expect(flash[:danger]).to eq "Prototype editing was failured."
        end
      end
    end

    describe "DELETE #destroy" do
      it "assigns the requested prototype to @prototype" do
        delete :destroy, id: @prototype
        expect(assigns(:prototype)).to eq @prototype
      end

      it "deletes the prototype" do
        expect{ delete :destroy, id: @prototype }.to change(Prototype, :count).by(-1)
      end

      it "redirects to root_path" do
        delete :destroy, id: @prototype
        expect(response).to redirect_to root_path
      end

      it "shows flash messages to show delete the prototype successfully" do
        delete :destroy, id: @prototype
        expect(flash[:success]).to eq flash[:success] = "Prototype was successfully deleted."
      end
    end
  end

  context "without user login" do
    before do
      @user = create(:user)
      @prototype = create(:prototype)
    end

    describe "GET #new" do
      it "redirects to sign_in page" do
        get :new
        expect(response).to redirect_to user_session_path
      end
    end

    describe "POST #create" do
      it "redirects to sign_in page" do
        post :create
        expect(response).to redirect_to user_session_path
      end
    end

    describe "GET #edit" do
      it "redirects to sign_in page" do
        get :edit, id: @prototype
        expect(response).to redirect_to user_session_path
      end
    end

    describe "PATCH #update" do
      it "redirects to sign_in page" do
        patch :update, id: @prototype
        expect(response).to redirect_to user_session_path
      end
    end

    describe "DELETE #destroy" do
      it "redirects to sign_in page" do
        delete :destroy, id: @prototype
        expect(response).to redirect_to user_session_path
      end
    end
  end
end
