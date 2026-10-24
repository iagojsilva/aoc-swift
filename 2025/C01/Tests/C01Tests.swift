@testable import AOC2025C01
import Testing

struct DialTests {
    @Test
    func landsExactlyOnZero() {
        var dial = Dial(position: 10)

        let crossings = dial.apply(Rotation(direction: .left, distance: 10))

        #expect(crossings == 1)
        #expect(dial.position == 0)
    }

    @Test(arguments: [RotationDirection.left, .right])
    func countsCompleteRevolutions(direction: RotationDirection) {
        var dial = Dial(position: 50)

        let crossings = dial.apply(Rotation(direction: direction, distance: 1_000))

        #expect(crossings == 10)
        #expect(dial.position == 50)
    }

    @Test
    func parsesAnInstruction() throws {
        let rotation = try Rotation("L250")

        #expect(rotation == Rotation(direction: .left, distance: 250))
        #expect(rotation.description == "L250")
    }

    @Test
    func samplePassword() throws {
        let instructions = [
            "L68", "L30", "R48", "L5", "R60",
            "L55", "L1", "L99", "R14", "L82",
        ]

        let crossings = try countZeroCrossings(in: instructions)

        #expect(crossings == 6)
    }

    @Test
    func secondSamplePassword() throws {
        let instructions = [
            "R49", "L7", "R3", "L43", "R13", "R50",
            "R41", "L31", "R44", "L24", "R10",
        ]

        let crossings = try countZeroCrossings(in: instructions)

        #expect(crossings == 1)
    }
}
