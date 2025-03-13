const std = @import("std");

pub fn main() !void {
    try std.io.getStdOut().writer().print("hello world!\n", .{});
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Howdy World!", .{});
}
