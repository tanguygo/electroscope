ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do

      column do
        panel "Recent Orders" do
          table_for Order.order('id desc').limit(10) do
            column("Status")   {|order| status_tag(order.status)                                    }
            column("User")    {|order| link_to(order.user.email, admin_user_path(order.user)) }
          end
        end
      end

      column do
        panel "Last Boxes" do
          table_for Box.order('id asc').limit(1).each do |box|
            column("Status")   {|box| status_tag(box.status)                                    }
            # column("User"){|box| link_to(box.user.email, admin_user_path(box.user)) }
            column("Last statement date")   {|box| box.statements.last.time_of_measure                       }
            column("Last statement power")   {|box| box.statements.last.power                        }
          end
        end
      end

      column do
        panel "Recent Customers" do
          table_for User.order('id desc').limit(10).each do |user|
            column(:email)    {|user| link_to(user.email, admin_user_path(user)) }
          end
        end
      end

    end # columns

    columns do
      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end
