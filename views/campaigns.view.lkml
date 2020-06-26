view: campaigns {
  sql_table_name: `ecomm.campaigns`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: advertising_channel {
    type: string
    sql: ${TABLE}.advertising_channel ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.bid_type ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_at ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  measure: count {
    type: count
    drill_fields: [id, campaign_name, ad_groups.count]
  }
}
