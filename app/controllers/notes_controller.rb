class NotesController < ApplicationController
  before_action :find_note, only: [:show, :update, :edit, :destroy]

  def index
    # @notes = Note.all.order("created_at DESC")
    @notes = Note.where(user_id: current_user)
  end

  def show
  end

  def new
    # current_user.notes.build => create note for current user
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      redirect_to @note
    else
      render 'new'
    end
  end

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

  def find_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
