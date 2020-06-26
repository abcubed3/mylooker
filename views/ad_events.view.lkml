view: ad_events {
  sql_table_name: `ecomm.ad_events`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: keyword_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.keyword_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, keywords.keyword_id, keywords.criterion_name, events.count]
  }
}
