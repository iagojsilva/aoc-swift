import Foundation

enum RotationDirection: Character {
    case left = "L"
    case right = "R"
}

enum RotationParsingError: Error, Equatable {
    case emptyInstruction
    case invalidDirection(Character)
    case invalidDistance(String)
}

struct Rotation: Equatable, CustomStringConvertible {
    let direction: RotationDirection
    let distance: Int

    init(direction: RotationDirection, distance: Int) {
        self.direction = direction
        self.distance = distance
    }

    init<Instruction: StringProtocol>(_ instruction: Instruction) throws {
        guard let rawDirection = instruction.first else {
            throw RotationParsingError.emptyInstruction
        }
        guard let direction = RotationDirection(rawValue: rawDirection) else {
            throw RotationParsingError.invalidDirection(rawDirection)
        }

        let rawDistance = instruction.dropFirst()
        guard let distance = Int(rawDistance), distance >= 0 else {
            throw RotationParsingError.invalidDistance(String(rawDistance))
        }

        self.init(direction: direction, distance: distance)
    }

    var description: String {
        "\(direction.rawValue)\(distance)"
    }
}

struct Dial {
    static let positionCount = 100

    private(set) var position: Int

    init(position: Int) {
        self.position = position.modulo(Self.positionCount)
    }

    @discardableResult
    mutating func apply(_ rotation: Rotation) -> Int {
        let completeRevolutions = rotation.distance / Self.positionCount
        let remainingDistance = rotation.distance % Self.positionCount
        let crossesZero: Bool

        switch rotation.direction {
        case .left:
            crossesZero = position != 0 && remainingDistance >= position
            position = (position - remainingDistance).modulo(Self.positionCount)
        case .right:
            crossesZero = position + remainingDistance >= Self.positionCount
            position = (position + remainingDistance).modulo(Self.positionCount)
        }

        return completeRevolutions + (crossesZero ? 1 : 0)
    }
}

func countZeroCrossings<Instructions: Sequence>(
    in instructions: Instructions,
    startingAt initialPosition: Int = 50
) throws -> Int where Instructions.Element: StringProtocol {
    var dial = Dial(position: initialPosition)
    var crossingCount = 0

    for instruction in instructions {
        crossingCount += dial.apply(try Rotation(instruction))
    }

    return crossingCount
}

private extension Int {
    func modulo(_ divisor: Int) -> Int {
        let remainder = self % divisor
        return remainder >= 0 ? remainder : remainder + divisor
    }
}
