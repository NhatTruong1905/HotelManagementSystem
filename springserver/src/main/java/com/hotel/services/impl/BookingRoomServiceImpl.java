package com.hotel.services.impl;

import com.hotel.converter.BookingRoomConverter;
import com.hotel.dto.BookingRoomDTO;
import com.hotel.dto.BookingRoomDTO;
import com.hotel.entity.*;
import com.hotel.repositories.BookingRepository;
import com.hotel.repositories.BookingRoomRepository;
import com.hotel.repositories.RoomRepository;
import com.hotel.services.BookingRoomService;
import com.hotel.services.BookingService;
import jakarta.persistence.NoResultException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class BookingRoomServiceImpl implements BookingRoomService {
    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    @Autowired
    private BookingRoomRepository bookingRoomRepository;
    @Autowired
    private BookingRoomConverter bookingRoomConverter;
    @Autowired
    private BookingRepository bookingRepository;
    @Autowired
    private RoomRepository roomRepository;
    @Autowired
    private BookingService bookingService;

    @Override
    public List<BookingRoomDTO> list(Map<String, String> params) {
        List<BookingRoom> bookingList = bookingRoomRepository.list(params);
        List<BookingRoomDTO> listBooking = new ArrayList<>();

        for (BookingRoom b : bookingList) {
            BookingRoomDTO bookingRoomDTO = bookingRoomConverter.toBookingRoomDTO(b);
            if (b.getRoom() != null) {
                bookingRoomDTO.setRoomName(b.getRoom().getRoomNumber());
            }
            if (b.getBooking() != null && b.getBooking().getCustomer() != null) {
                bookingRoomDTO.setBookingCustomerName(b.getBooking().getCustomer().getName());
            }

            listBooking.add(bookingRoomDTO);
        }
        return listBooking;
    }

    @Override
    public long count(Map<String, String> params) {
        return bookingRoomRepository.count(params);
    }

    @Override
    public void addOrUpdate(BookingRoomDTO bookingRoomDTO) {
        BookingRoom bookingRoom = bookingRoomConverter.toBookingRoom(bookingRoomDTO);
        Booking booking = bookingRepository.get(bookingRoomDTO.getBookingId());
        Room room = roomRepository.get(bookingRoomDTO.getRoomId());
        if (booking != null && room != null) {
            bookingRoom.setBooking(booking);
            bookingRoom.setRoom(room);
            bookingRoom.setPriceAtBooking(room.getType().getBasePrice());
        } else {
            throw new RuntimeException("Không tìm thấy Đơn đặt phòng hoặc Phòng tương ứng!");
        }
        Integer roomTypeId = this.bookingRoomRepository.addOrUpdateReturnObject(bookingRoom).getRoom().getType().getId();
        bookingService.recalculateTotalAmount(bookingRoomDTO.getBookingId());

        messagingTemplate.convertAndSend("/topic/room-type/" + roomTypeId, "ROOM_UPDATED");
        System.out.printf("Send Message to RoomType ID: %d\n", roomTypeId);
    }

    @Override
    public void delete(int id) {
        Integer roomTypeId = this.bookingRoomRepository.get(id).getRoom().getType().getId();
        this.bookingRoomRepository.delete(id);
        messagingTemplate.convertAndSend("/topic/room-type/" + roomTypeId, "ROOM_UPDATED");
        System.out.printf("Send Message to RoomType ID: %d\n", roomTypeId);
    }

    @Override
    public void delete(List<Integer> ids) {
        List<RoomType> listRoomType = this.bookingRoomRepository.listRoomType(ids);
        this.bookingRoomRepository.delete(ids);
        System.out.println(listRoomType);
        listRoomType.forEach(rt -> {
            messagingTemplate.convertAndSend("/topic/room-type/" + rt.getId(), "ROOM_UPDATED");
            System.out.printf("Send Message to RoomType ID: %d\n", rt.getId());
        });
    }

    @Override
    public BookingRoomDTO get(int id) {
        return null;
    }

    @Override
    public BookingRoomDTO save(BookingRoomDTO entity) {
        return null;
    }
}
