import React, { useState, useEffect } from 'react';
import { Card, Button } from 'react-bootstrap';
import { useNavigate, useLocation } from 'react-router-dom';

const GlobalPaymentWidget = () => {
    const [pendingId, setPendingId] = useState(null);
    const [paymentUrl, setPaymentUrl] = useState(null);
    const [timeLeft, setTimeLeft] = useState(0);
    const navigate = useNavigate();
    const location = useLocation();

    useEffect(() => {
        const checkPendingBooking = () => {
            const expireTime = localStorage.getItem('pendingBookingExpire');
            const bId = localStorage.getItem('pendingBookingId');
            const url = localStorage.getItem('pendingPaymentUrl');

            if (bId && expireTime && url) {
                const now = Date.now();
                if (now < parseInt(expireTime)) {

                    setPendingId(bId);
                    setPaymentUrl(url);
                    setTimeLeft(Math.floor((parseInt(expireTime) - now) / 1000));
                } else {
                    alert(`Đơn đặt phòng #${bId} đã hết 15 phút chờ thanh toán và đã bị hệ thống hủy. Vui lòng chọn và đặt lại phòng mới!`);
                    localStorage.removeItem('pendingBookingId');
                    localStorage.removeItem('pendingBookingExpire');
                    localStorage.removeItem('pendingPaymentUrl');
                    setPendingId(null);
                    navigate('/');
                }
            } else {
                setPendingId(null);
            }
        };

        checkPendingBooking();
        const interval = setInterval(checkPendingBooking, 1000);
        return () => clearInterval(interval);
    }, [location.pathname, navigate]);

    const handleCancelPendingBooking = () => {
        const confirmCancel = window.confirm("Bạn có chắc chắn muốn hủy thanh toán đơn hiện tại để chọn phòng khác không?");
        if (confirmCancel) {
            localStorage.removeItem('pendingBookingId');
            localStorage.removeItem('pendingBookingExpire');
            localStorage.removeItem('pendingPaymentUrl');
            setPendingId(null);

            navigate('/');
        }
    };


    if (!pendingId || location.pathname.includes('/payment')) return null;

    const formatTime = (seconds) => {
        const m = Math.floor(seconds / 60);
        const s = seconds % 60;
        return `${m}:${s < 10 ? '0' : ''}${s}`;
    };

    return (
        <Card
            className="position-fixed shadow-lg border-0 rounded-4 p-3"
            style={{
                bottom: '24px',
                left: '24px',
                zIndex: 9999,
                width: '320px',
                borderLeft: '4px solid #dc3545',
                backgroundColor: 'rgba(255, 255, 255, 0.95)',
                backdropFilter: 'blur(10px)'
            }}
        >
            <div className="d-flex flex-column">
                <div className="d-flex justify-content-between align-items-center mb-2">
                    <h6 className="fw-bold text-danger mb-0">
                        <i className="bi bi-clock-history me-2"></i>Đang chờ thanh toán
                    </h6>

                    <button
                        type="button"
                        className="btn-close"
                        aria-label="Close"
                        style={{ fontSize: '12px' }}
                        onClick={handleCancelPendingBooking}
                    ></button>
                </div>

                <p className="small text-muted mb-3">
                    Đơn đặt phòng <b>#{pendingId}</b> của bạn sẽ bị hệ thống tự động hủy sau: <strong className="text-danger fs-6">{formatTime(timeLeft)}</strong>
                </p>

                <Button
                    variant="danger"
                    size="sm"
                    className="fw-bold w-100 rounded-3 py-2"
                    onClick={() => navigate(paymentUrl, { state: { bookingId: pendingId } })}
                >
                    Tiếp tục thanh toán ngay <i className="bi bi-arrow-right"></i>
                </Button>
            </div>
        </Card>
    );
};

export default GlobalPaymentWidget;