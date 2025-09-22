class CreateKeycloakServices < ActiveRecord::Migration[8.0]
  def change
    create_table :keycloak_services do |t|
      t.timestamps
    end
  end
end
