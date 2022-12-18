class Star {
    constructor(rays, x, y, radius1, radius2, color = 'yellow') {
        this.rays = rays
        this.x = x
        this.y = y
        this.radius1 = radius1
        this.radius2 = radius2
        this.angle = 0
        this.color = color

        this._dx = 0
        this._dy = 0
        this._deltaAngle = 0
    }

    get dx() {
        return this._dx
    }

    get dy() {
        return this._dy
    }

    set dx(value) {
        if (Math.abs(value - 0) < 0.00001) {
            this._dx = 1
        } else {
            this._dx = value
        }
    }

    set dy(value) {
        if (Math.abs(value - 0) < 0.00001) {
            this._dy = 1
        } else {
            this._dy = value
        }
    }

    get deltaAngle() {
        return this._deltaAngle
    }

    set deltaAngle(value) {
        if (Math.abs(value - 0) < 0.00001) {
            this._deltaAngle = 0.05
        } else {
            this._deltaAngle = value
        }
    }

    draw(ctx) {
        this.rays += this.rays % 2
        const angleDelta = 2 * Math.PI / this.rays

        let prevEndX = this.x + Math.cos(this.angle - angleDelta) * this.radius2
        let prevEndY = this.y + Math.sin(this.angle - angleDelta) * this.radius2

        for (let i = 0; i < this.rays; i++) {
            const radius = i % 2 === 0 ? this.radius1 : this.radius2
            const endX = this.x + Math.cos(this.angle) * radius
            const endY = this.y + Math.sin(this.angle) * radius

            ctx.strokeStyle = this.color
            ctx.beginPath()
            ctx.moveTo(this.x, this.y)
            ctx.lineTo(endX, endY)
            ctx.lineTo(prevEndX, prevEndY)
            ctx.stroke()

            this.angle += angleDelta
            prevEndX = endX
            prevEndY = endY
        }
    }

    move(boundaryX, boundaryY) {
        this.x += this.dx
        if (this.x + this.radius1 > boundaryX || this.x - this.radius1 < 0) {
            this.dx = -this.dx
        }

        this.y += this.dy
        if (this.y + this.radius1 > boundaryY || this.y - this.radius1 < 0) {
            this.dy = -this.dy
        }
    }

    rotate() {
        this.angle += this.deltaAngle
    }
}
