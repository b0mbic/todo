class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks
  has_many :categories
  has_many :tags
  after_create :add_default_items



  validates :email, presence: :true, uniqueness: { case_sensitive: false }
  validates :username, presence: :true, uniqueness: { case_sensitive: false }


  private
  def add_default_items

    #default categories
    category1 = self.categories.create({title: "Osobní", color: "#89cff0"})
    kategorie_skola = self.categories.create({title: "Škola", color: "#0000ff"})
    self.categories.create({title: "Práce", color: "#008000"})

    #default tags
    tag_ucl = self.tags.create({title: "UCL", color: "#ccff00"})
    self.tags.create({title: "JSE", color: "#794044"})
    tag_web = self.tags.create({title: "WEB", color: "#ff4040"})
    self.tags.create({title: "3DT", color: "#66cccc"})
    self.tags.create({title: "PR1", color: "#8a2be2"})
    self.tags.create({title: "PES", color: "#ff80ed"})
    tag_nakupy = self.tags.create({title: "Nákupy", color: "#133337"})
    self.tags.create({title: "Wishlist", color: "#008080"})

    #default tasks
    self.tasks.create({title: "Toto je jednoduchý úkol"})
    self.tasks.create({title: "Toto je už dokončený úkol", is_done: true })
    self.tasks.create({title: "Nakoupit na večeři", category_id: category1.id, tag_ids: [tag_nakupy.id] })
    self.tasks.create({title: "Udělat semestrální práci z předmětu WEB", category_id: kategorie_skola.id, tag_ids: [tag_ucl.id, tag_web.id] })


  end

end
