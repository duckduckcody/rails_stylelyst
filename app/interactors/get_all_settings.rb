class GetAllSettings
  include Interactor

  def call
    context.settings = { 'genders': Gender.all, 'categories': Category.all }
  end
end
