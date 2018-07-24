class ProjectsController < ApplicationController
    #  A before action runs some action before any controller functions are rendered.
    before_action :find_item, only: [:show, :edit, :update, :destroy]

    def index
        if user_signed_in?
            @projects = Project.where(:user_id => current_user.id).order("created_at DESC")
        end
        #@projects = Project.all.order("created_at DESC")        
    end

    def show 
    end

    def new
        # @project = Project.new
        @project = current_user.projects.build
    end

    def create
        # @project = Project.new(project_params)
        @project = current_user.projects.build(project_params)
        if @project.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @project.update(project_params)
            redirect_to project_path(@project)
        else
            render 'edit'
        end
    end

    def destroy
        @project.destroy
        redirect_to root_path
    end

    def complete
        @project = Project.find(params[:id])
        @project.update_attribute(:completed_at, Time.now)
        redirect_to root_path 
    end

    private
        def project_params
            params.require(:project).permit(:name,:description)
        end

        def find_item
            @project = Project.find(params[:id])
        end
end
