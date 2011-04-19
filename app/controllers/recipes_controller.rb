class RecipesController < ApplicationController
  
  before_filter :authenticate_user!
  
  respond_to :html, :xml, :json
  
  def index
    @recipes = Recipe.all    
    
    respond_with @recipes
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    
    respond_with @recipes    
  end
  
  def new
    @recipe = Recipe.new
    
    respond_with @recipes 
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
    
    respond_with @recipes
  end
  
  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.user_id = current_user.id
    
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully created.') }
        format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end

  end
  
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.user_id = current_user.id
    
    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully updated.') }
        format.xml  { render :ok }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end

  end
  
  def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      flash[:notice] = 'The recipe was destroyed'
    else 
      flash[:alert] = 'The recipe could not be destroyed'
    end
    
    respond_with [recipe, @recipe] do |format|
      format.html{
        redirect_to(recipes_path)        
      }
    end
  end
  
end
