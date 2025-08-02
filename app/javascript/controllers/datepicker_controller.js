
import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  static values = { bookedDates: Array }

  connect() {
    const bookedDates = this.bookedDatesValue || []
    const today = new Date()
    today.setHours(0, 0, 0, 0)

    flatpickr(this.element, {
      dateFormat: "Y-m-d H:i",
      minDate: "today",
      disable: [
        (date) => {
          if (date <= today) return true
          const ds = date.toISOString().slice(0, 10)
          return bookedDates.includes(ds)
        }
      ],

      onChange: function(selectedDates) {
        if (selectedDates.length === 0) return

        const selectedDate = selectedDates[0]
        const now = new Date()

        if (selectedDate.toDateString() === now.toDateString()) {
          let minHour = now.getHours()
          let minMinute = Math.ceil(now.getMinutes() / 15) * 15

          if (minMinute === 60) {
            minHour += 1
            minMinute = 0
          }

          const minTimeStr = `${String(minHour).padStart(2, "0")}:${String(minMinute).padStart(2, "0")}`
          this.set("minTime", minTimeStr)
        } else {
          this.set("minTime", "00:00")
        }
      }
    })
  }
}
