import Testing

@testable import AOC2025C02

struct ATests {
  @Test
  func expandRange() throws {
    let ranges: [(range: String, expanded: [Int])] = [
      ("11-22", Array(11...22)),
      ("95-115", Array(95...115)),
      ("998-1012", Array(998...1012)),
      ("1188511880-1188511890", Array(1_188_511_880...1_188_511_890)),
      ("222220-222224", Array(222220...222224)),
      ("1698522-1698528", Array(1_698_522...1_698_528)),
      ("446443-446449", Array(446443...446449)),
      ("38593856-38593862", Array(38_593_856...38_593_862)),
      ("565653-565659", Array(565653...565659)),
      ("824824821-824824827", Array(824_824_821...824_824_827)),
      ("2121212118-2121212124", Array(2_121_212_118...2_121_212_124)),
    ]

    for range in ranges {
      let expanded = AOC2025C02.expandRange(range: range.range)
      #expect(expanded == range.expanded)
    }
  }

  @Test
  func duplicates() throws {
    let ranges: [(range: [Int], duplicates: [Int])] = [
      (Array(11...22), [11, 22]),
      (Array(95...115), [99]),
      (Array(998...1012), [1010]),
      (Array(1_188_511_880...1_188_511_890), [1_188_511_885]),
      (Array(222220...222224), [222222]),
      (Array(1_698_522...1_698_528), []),
      (Array(446443...446449), [446446]),
      (Array(38_593_856...38_593_862), [38_593_859]),
      (Array(565653...565659), []),
      (Array(824_824_821...824_824_827), []),
      (Array(2_121_212_118...2_121_212_124), []),
    ]

    for range in ranges {
      let duplicated = AOC2025C02.duplicates(range: range.range)
      #expect(duplicated == range.duplicates)
    }
  }
  @Test func sum() throws {
    let values = [
      11, 22, 99, 1010, 1_188_511_885, 222222, 446446, 38_593_859,
    ]
    #expect(AOC2025C02.sum(values: values) == 1_227_775_554)
  }

  @Test func sampleInput() throws {
    let input =
      "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"

    var duplicates: [Int] = []

    for range in input.split(separator: ",") {
      let expanded = AOC2025C02.expandRange(range: String(range))
      let duplicated = AOC2025C02.duplicates(range: expanded)
      duplicates.append(contentsOf: duplicated)
    }

    #expect(AOC2025C02.sum(values: duplicates) == 4_174_379_265)
  }
}
