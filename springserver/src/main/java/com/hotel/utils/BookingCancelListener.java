package com.hotel.utils;

import com.hotel.configs.RabbitMQConfig;
import com.hotel.dto.requestbooking.RequestBookingDTO;
import com.hotel.repositories.BookingRepository;
import com.hotel.services.MailService;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class BookingCancelListener {
    @Autowired
    private MailService mailService;
    @Autowired
    private BookingRepository bookingRepository;

    @RabbitListener(queues = RabbitMQConfig.CANCEL_QUEUE)
    @Transactional
    public void receiveCancelMessage(String messageStr) {
        try {
            Integer bookingId = Integer.parseInt(messageStr);
            System.out.println("Đã nhận được tin nhắn quá hạn cho Booking #" + bookingId);

            boolean isActuallyCancelled = bookingRepository.processExpiredBooking(bookingId);
            if (isActuallyCancelled) {
                System.out.println("-> Đơn #" + bookingId + " chưa thanh toán. Đã hủy & Đang gửi Email!");
                this.mailService.sendBookingCancellationDueToTimeout(bookingId);
            } else {
                System.out.println("-> Đơn #" + bookingId + " đã thanh toán thành công trước đó. Bỏ qua gửi Email.");
            }
        } catch (Exception e) {
            System.err.println("Lỗi khi hủy đơn từ RabbitMQ: " + e.getMessage());
        }
    }
}