const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    var i: u8 = 1;
    while (i <= 100) : (i += 1) { // what a strange loop syntax, interesting...
        var output: []u8 = "";
        if (divisible(i, 3)) {
            output = try std.fmt.allocPrint(allocator, "{s} {s}", .{ output, "fizz" });
        }
        if (divisible(i, 5)) {
            output = try std.fmt.allocPrint(allocator, "{s} {s}", .{ output, "buzz" });
        } else if (output.len == 0) {
            output = try std.fmt.allocPrint(allocator, "{s} {d}", .{ output, i });
        }
        try stdout.print("{s}\n", .{output});
    }
}
pub fn divisible(n: u8, divisor: u8) bool {
    return n % divisor == 0;
}
