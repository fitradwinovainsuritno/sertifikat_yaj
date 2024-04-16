<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class generate extends CI_Controller {

	public function __construct() {

		parent::__construct();
		
		$this->load->model('M_generate');
		$this->load->model('M_sertifikat');
		$this->load->model('M_event');

		if (!$this->session->userdata('username')) {
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Login First!</div>');
            redirect('admin');
        }
		
	}

	public function index()
	{
		$profil['profil'] = $this->db->get_where('users', ['username' => $this->session->userdata('username')])->row_array();

		$title['title'] = 'Generate Certificates - Certificate Online';

		$year['year'] = date('Y');

        $user_id = $this->db->get_where('users',['username' => $this->session->userdata('username')])->row_array();

        $a = $user_id['user_id'];

		$generate = $this->db->query("SELECT * FROM certificate_assignments WHERE user_id=$a")->result();
		$certificate = $this->M_sertifikat->getDataCertificate();
		$event = $this->M_event->getDataEvent();
		$users = $this->db->query("SELECT * FROM users WHERE level='user'")->result();

		$data['generate'] = $generate;
		$data['certificate'] = $certificate;
		$data['event'] = $event;
		$data['users'] = $users;

		$this->load->view('partials/_header', $title);
		$this->load->view('partials/_navbar', $profil);
		$this->load->view('partials/_sidebar');
		$this->load->view('sertifikat/generate', $data);
		$this->load->view('partials/_footer', $year);
	}

	public function fungsi_tambah()
    {
        $profil['profil'] = $this->db->get_where('users', ['username' => $this->session->userdata('username')])->row_array();

        $certificate_id = $this->input->post('certificate_id');
        $user_id = $this->input->post('user_id');
        $event_id = $this->input->post('event_id');
        $assigned_at = $this->input->post('assigned_at');

        $ArrInsert = array(
            'certificate_id' => $certificate_id,
            'user_id' => $user_id,
            'event_id' => $event_id,
            'assigned_at' => $assigned_at
        );

        $this->M_generate->insertDataGenerate($ArrInsert);
        $this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">Generate added successfully!</div>');
		redirect($_SERVER['HTTP_REFERER']);
    }

	public function fungsi_hapus($id)
    {
        $profil['profil'] = $this->db->get_where('users', ['username' => $this->session->userdata('username')])->row_array();

        $this->M_generate->hapusDataGenerate($id);
        $this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">Generate deleted successfully!</div>');

        redirect($_SERVER['HTTP_REFERER']);
    }

	public function download($id)
    {
        $certificate = $this->M_sertifikat->getDataCertificateDetail($id);
        $event = $this->M_event->getDataEventDetail($id);
		
        $data['sertifikat'] = $certificate;
        $data['event'] = $event;

        $this->load->library('dompdf_gen');
        $this->load->view('sertifikat/download', $data);

        $paper_size = 'A4';
        $orientation = 'landscape';
        $html = $this->output->get_output();

        $this->dompdf->set_paper($paper_size, $orientation);
        $this->dompdf->load_html($html);
        $this->dompdf->render();
        $this->dompdf->stream('Certificate.pdf', array('Attachment' => 0));
    }
}