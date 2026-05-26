package com.hotel.repositories;

import com.hotel.entity.BookingRoom;
import com.hotel.entity.RoomType;

import java.util.List;

public interface BookingRoomRepository extends BaseRepository<BookingRoom> {
    BookingRoom addOrUpdateReturnObject(BookingRoom bookingRoom);
    List<RoomType> listRoomType(List<Integer> idsBookingRoom);
}
