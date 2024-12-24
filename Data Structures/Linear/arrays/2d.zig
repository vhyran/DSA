const std = @import("std");
const expect = std.testing.expect;

const mat4x4 = [4][4]f32{
    [_]f32{ 1.0, 0.0, 0.0, 0.0 },
    [_]f32{ 0.0, 1.0, 0.0, 1.0 },
    [_]f32{ 0.0, 0.0, 1.0, 0.0 },
    [_]f32{ 0.0, 0.0, 0.0, 1.0 },
};

pub fn main() void {
    for (mat4x4, 0..) |row, row_index| {
        for (row, 0..) |cell, column_index| {
            if (row_index == column_index) {
                std.debug.print("Diagonal element at [{}][{}]: {}\n", .{ row_index, column_index, cell });
            }
        }
    }
}

test "multidimensional arrays" {
    try expect(mat4x4[1][1] == 1.0);
    try expect(mat4x4[1][3] == 1.0);
    try expect(mat4x4[3][3] == 1.0);

    for (mat4x4, 0..) |row, row_index| {
        for (row, 0..) |cell, column_index| {
            if (row_index == column_index) {
                try expect(cell == 1.0);
            }
        }
    }

    for (mat4x4, 0..) |row, row_index| {
        for (row, 0..) |cell, column_index| {
            if (row_index != column_index) {
                try expect(cell == 0.0);
            }
        }
    }
}
