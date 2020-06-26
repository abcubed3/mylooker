connection: "thelook_bq"

# include all the views
include: "/views/**/*.view"

datagroup: abdul_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: abdul_default_datagroup

explore: ad_events {
  join: keywords {
    type: left_outer
    sql_on: ${ad_events.keyword_id} = ${keywords.keyword_id} ;;
    relationship: many_to_one
  }
}

explore: ad_groups {
  join: campaigns {
    type: left_outer
    sql_on: ${ad_groups.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }
}

explore: campaigns {}

explore: connection_reg_r3 {}

explore: distribution_centers {}

explore: events {
  join: ad_events {
    type: left_outer
    sql_on: ${events.ad_event_id} = ${ad_events.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: keywords {
    type: left_outer
    sql_on: ${ad_events.keyword_id} = ${keywords.keyword_id} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: keywords {}

explore: order_items {
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: products {
  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: users {}
