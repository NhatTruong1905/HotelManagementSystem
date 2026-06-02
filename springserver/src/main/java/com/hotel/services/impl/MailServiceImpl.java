package com.hotel.services.impl;

import com.hotel.dto.requestbooking.DetailCustomerDTO;
import com.hotel.entity.Booking;
import com.hotel.repositories.BookingRepository;
import com.hotel.repositories.BookingRoomRepository;
import com.hotel.repositories.BookingServiceRepository;
import com.hotel.services.BookingService;
import com.hotel.services.MailService;
import jakarta.mail.internet.MimeMessage;
import com.hotel.dto.requestbooking.RequestBookingDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring6.SpringTemplateEngine;

import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;

@Service
public class MailServiceImpl implements MailService {
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private SpringTemplateEngine emailTemplateEngine;
    @Value("${mail.username}")
    private String mailUserName;

    @Autowired
    private BookingRepository bookingRepository;
    @Autowired
    private BookingServiceRepository bookingServiceRepository;
    @Autowired
    private BookingRoomRepository bookingRoomRepository;

    @Override
    @Async
    public void sendBookingConfirmation(RequestBookingDTO booking) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(
                    message,
                    MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                    StandardCharsets.UTF_8.name()
            );

            Context context = new Context();
            context.setVariable("booking", booking);
            String htmlContent = emailTemplateEngine.process("booking_confirmation", context);

            helper.setTo(booking.getCustomer().getEmail());
            helper.setSubject("Thông Báo: Xác Nhận Đặt Phòng Thành Công tại Spring Hotel");
            helper.setText(htmlContent, true);
            helper.setFrom(this.mailUserName);

            mailSender.send(message);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    @Async
    public void sendBookingCancellationDueToTimeout(Integer bookingId) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(
                    message,
                    MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                    StandardCharsets.UTF_8.name()
            );

            Booking booking = this.bookingRepository.get(bookingId);
            RequestBookingDTO bookingDTO = new RequestBookingDTO();
            DetailCustomerDTO customer = new DetailCustomerDTO();
            customer.setFullName(booking.getCustomer().getName());
            customer.setEmail(booking.getCustomer().getEmail());

            bookingDTO.setTotalPrice(booking.getTotalAmount());
            bookingDTO.setCustomer(customer);
            bookingDTO.setExpectedCheckIn(booking.getExpectedCheckIn());
            bookingDTO.setExpectedCheckOut(booking.getExpectedCheckOut());

            Context context = new Context();
            context.setVariable("booking", bookingDTO);
            String htmlContent = emailTemplateEngine.process("mail/booking_cancellation", context);

            helper.setTo(booking.getCustomer().getEmail());
            helper.setSubject("Thông Báo: Đơn Đặt Phòng Của Bạn Đã Bị Huỷ Do Quá Hạn Thanh Toán");
            helper.setText(htmlContent, true);
            helper.setFrom(this.mailUserName);

            mailSender.send(message);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
