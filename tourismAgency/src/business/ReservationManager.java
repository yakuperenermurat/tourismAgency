package business;

import dao.ReservationDao;
import entity.Reservation;
import entity.Room;

import java.util.ArrayList;

public class ReservationManager {
    private ReservationDao reservationDao;

    // Constructor, ReservationDao nesnesini başlatır
    public ReservationManager() {
        this.reservationDao = new ReservationDao();
    }

    // ID'ye göre rezervasyon döndürür
    public Reservation getReservationById(int roomId) {
        return reservationDao.findById(roomId);
    }

    // Yeni bir rezervasyon ekler
    public boolean addReservation(Reservation reservation) {
        return reservationDao.addReservation(reservation);
    }

    // Oda stokunu günceller
    public boolean updateRoomStock(int roomId, int newStock) {
        return reservationDao.updateRoomStock(roomId, newStock);
    }

    // Rezervasyon bilgilerini günceller
    public boolean updateReservation(Reservation reservation) {
        return reservationDao.updateReservation(reservation);
    }

    // Rezervasyonu siler
    public void deleteReservation(int reservationId) {
        reservationDao.deleteReservation(reservationId);
    }

    // Rezervasyon verilerini tablo formatında döndürür
    public ArrayList<Object[]> getForTable(int size, ArrayList<Reservation> reservations) {
        ArrayList<Object[]> reservationList = new ArrayList<>();
        for (Reservation obj : reservations) {
            int i = 0;
            Object[] rowObject = new Object[size];
            rowObject[i++] = obj.getReservation_id();
            rowObject[i++] = obj.getReservation_room_id();
            rowObject[i++] = obj.getReservation_customer_name();
            rowObject[i++] = obj.getReservation_check_in_date();
            rowObject[i++] = obj.getReservation_check_out_date();
            rowObject[i++] = obj.getReservation_total_price();
            rowObject[i++] = obj.getReservation_guest_count_adult();
            rowObject[i++] = obj.getReservation_guest_count_child();
            rowObject[i++] = obj.getReservation_customer_email();
            rowObject[i++] = obj.getReservation_customer_tc();
            rowObject[i++] = obj.getReservation_customer_note();

            reservationList.add(rowObject);
        }
        return reservationList;
    }

    // Tüm rezervasyonları döndürür
    public ArrayList<Reservation> findAll() {
        return reservationDao.findAll();
    }
}