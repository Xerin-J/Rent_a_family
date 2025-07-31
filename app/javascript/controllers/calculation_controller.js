import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["startTime", "endTime", "from", "to", "totalCost"]
  static values = { hourlyRate: Number }

  calculate() {
    const startDate = new Date(this.startTimeTarget.value)
    const endDate = new Date(this.endTimeTarget.value)

    const startHourParts = this.fromTarget.value.split(":")
    const endHourParts = this.toTarget.value.split(":")

    if (
      !isNaN(startDate) && !isNaN(endDate) &&
      startHourParts.length === 2 && endHourParts.length === 2
    ) {
      let dayDiff = Math.floor((endDate - startDate) / (1000 * 60 * 60 * 24))

      const startHourDecimal = parseInt(startHourParts[0]) + parseInt(startHourParts[1]) / 60
      const endHourDecimal = parseInt(endHourParts[0]) + parseInt(endHourParts[1]) / 60

      let hourDiff = endHourDecimal - startHourDecimal
      if (hourDiff < 0) hourDiff = 0

      const totalHours = dayDiff * 24 + hourDiff

      if (totalHours > 0) {
        const totalCost = totalHours * this.hourlyRateValue
        this.totalCostTarget.value = totalCost.toFixed(2)
      } else {
        this.totalCostTarget.value = "0.00"
      }
    } else {
      this.totalCostTarget.value = "0.00"
    }
  }
}