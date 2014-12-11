ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Orders" do
          table_for Order.order('id desc').limit(10) do
            column("Initiation date")    {|order| link_to(order.creation_date, admin_order_path(order)) }
            column("User")    {|order| link_to(order.user.email, admin_user_path(order.user)) }
            column("Status")   {|order| status_tag(order.status)                                    }
          end
        end
      end
      column do
        panel "Recent Customers" do
          table_for User.order('id desc').limit(10).each do |user|
            column(:created_at)    {|user| user.created_at.strftime("%d-%B-%Y") }
            column(:first_name)    {|user| user.first_name }
            column(:last_name)    {|user| user.last_name }
            column(:email)    {|user| link_to(user.email, admin_user_path(user)) }
          end
        end
      end
    end # columns

    columns do
      column do
        panel "Recent Boxes" do
          table_for Box.order('id desc').limit(10).each do |box|
            column("Internal reference")   {|box| box.internal_ref       }
            column("Status")   {|box| status_tag(box.status)}
            column("User")    {|box| box.status=="active" ? link_to(box.user.last_name, admin_user_path(box.user))  : "ND"  }
            column("Last statement date")   {|box| box.status=="active" ? box.statements.last.time_of_measure : "ND"}
            column("Last statement power")   {|box| box.status=="active" ? box.statements.last.power : "ND" }
          end
        end
      end
    end
  end # content
end
