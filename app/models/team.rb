class Team < ApplicationRecord
  has_attached_file :payment_proof, styles: { large:"800x800>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :payment_proof, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_secure_password validations: false

  validates :email, format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
              message: "Adresse email invalide."
            }

  validates :leader, presence: { message: "Le chef d'équipe doit être renseigné." }
  validates :email, presence: { message: "L'adresse email doit être renseigné." }

  validates :leader, uniqueness: { message: "Le chef d'équipe doit être unique." }
  validates :email, uniqueness: { message: "L'adresse email doit être unique." }

  validates :cin, presence: { message: "Le numéro cin doit être renseigné." }
  validates :phone, presence: { message: "Le numéro de téléphone doit être renseigné." }
  validates :password, presence: { message: "Le mot de passe doit être renseigné." }
  validates :contest, presence: { message: "La compétition doit être renseignée." }
  validates :robot, presence: { message: "Le nom du robot doit être renseigné." }
  validates :university, presence: { message: "L'établissement doit être renseigné." }

  validates :phone, length: { is: 8, message: "Numéro de téléphone non valide." }
  validates :cin, length: { in: 7..8, message: "Numéro CIN non valide." }

end
